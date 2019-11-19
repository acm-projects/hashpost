from __future__ import absolute_import, division, print_function, unicode_literals
import tensorflow as tf

import requests
import os
import base64
import urllib.parse
from typing import List
from models import PostMetadata
import json

import IPython.display as display
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
import pathlib

AUTOTUNE = tf.data.experimental.AUTOTUNE
IMG_WIDTH = 299
IMG_HEIGHT = 299

# TF Model Variables
# data_dir = pathlib.Path("C:/Users/Mr. Jeevs/.keras/datasets/flower_photos")
data_dir = pathlib.Path("C:/Users/Mr. Jeevs/.keras/datasets/train2017")
print(data_dir)

image_count = len(list(data_dir.glob('*.jpg')))
print(image_count)

'''
CLASS_NAMES = np.array([item.name for item in data_dir.glob('*') if item.name != "LICENSE.txt"])
print(CLASS_NAMES)

roses = list(data_dir.glob('roses/*'))
for image_path in roses[:3]:
    display.display(Image.open(str(image_path)))
'''

# Imagga Variables
API_BASE = 'https://api.imagga.com/v2'
API_ENDPOINT_TAGS = f'{API_BASE}/tags'
TAG_LIMIT = 10

class PostPredictionData:
    """Data containing information about post prediction.
    
    Attributes:
        confidence (float): The probability that this prediction is correct
        tag (str): A predicted tag for a given image
    """
    def __init__(self, confidence: float, tag: str):
        self.confidence = confidence
        self.tag = tag


def _get_imagga_data(image_url: str):
    api_key = os.getenv('IMAGGA_API_KEY', None) # Get API Key From Environment Variable
    if api_key is None:
        raise Exception('API key not provided in environment variables!')
    hashed_key = str(base64.b64encode(api_key.encode('utf-8')), 'utf-8')
    url_query = urllib.parse.quote(image_url) # URL Encode Given Image URL
    '''
    headers = {
        'Authorization': f'Basic {hashed_key}'
    }
    '''
    access_url = f'https://api.imagga.com/v2/tags?image_url={url_query}&limit={TAG_LIMIT}'

    # TODO: Does Not Accept "hashed_key" as a parameter. Figure what "api_secret" is
    response = requests.get(access_url, auth=(api_key, hashed_key))
    response_json = response.json()
    return response_json

def generate_image_metadata(image_url: str) -> List[PostPredictionData]:

    """Generate image metadata.

    Returns:
        A list of PostPredictionData containing results from hashtag generation.
    """
    result_json = _get_imagga_data(image_url)
    predictions = []
    for json_object in result_json.result.tags:
        tag = json_object['tag']['en']
        confidence = json_object['confidence']
        prediction = PostPredictionData(confidence, tag)
        predictions.append(prediction)
    return predictions

def __get__tag__data():
    with open("instances_train2017.json") as f:
        train_data = json.load(f)

    images = train_data["images"]
    annotations = train_data["annotations"]

    fileNames = []
    catIDs = []

    for i in images[:10]:
        fileNames.append(i["file_name"])
        for j in annotations:
            if(i["id"] == j["image_id"]):
                catIDs.append(j["category_id"])
                break

    print(fileNames)
    print(catIDs)

    list_ds = tf.data.Dataset.from_tensor_slices((fileNames, catIDs))

    print("8=========================================================>")
    for f in list_ds.take(5):
        print(f)
    print("8=========================================================>")

    # Set `num_parallel_calls` so multiple images are loaded/processed in parallel.
    labeled_ds = list_ds.map(process_img_label, num_parallel_calls=AUTOTUNE)
    print(labeled_ds)
    print("8=========================================================>")
    thing = labeled_ds.take(1)
    print(thing)

    m = tf.keras.Sequential([
        hub.KerasLayer("https://tfhub.dev/google/imagenet/inception_resnet_v2/classification/4", trainable=True, arguments=dict(batch_norm_momentum=0.99))
    ])

    m.build([None, 299, 299, 3])  # Batch input shape.

def decode_img(img):
  # convert the compressed string to a 3D uint8 tensor
  img = tf.image.decode_jpeg(img, channels=3)
  # Use `convert_image_dtype` to convert to floats in the [0,1] range.
  img = tf.image.convert_image_dtype(img, tf.float32)
  # resize the image to the desired size.
  return tf.image.resize(img, [IMG_WIDTH, IMG_HEIGHT])

def process_img_label(fileName, label):
    # load the raw data from the file as a string
    img = tf.io.read_file(f'C:/Users/Mr. Jeevs/.keras/datasets/train2017/{fileName}')
    img = decode_img(img)
    print(img)
    print(fileName)
    print(label)
    return img, label

def get_file_name(data):
    return data["file_name"]

__get__tag__data()