import requests
import os
import base64
from typing import List
from models import PostMetadata

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
    api_key = os.getenv('IMAGGA_API_KEY', None)
    if api_key is None:
        raise Exception('API key not provided in environment variables!')
    hashed_key = str(base64.b64encode(api_key.encode('utf-8')), 'utf-8')
    data = {
        'image': image_url,
        'limit': TAG_LIMIT,
    }
    headers = {
        'Authorization': f'Basic {hashed_key}'
    }
    response = requests.post(API_ENDPOINT_TAGS, data, headers)
    response_json = response.json()
    return response_json


def generate_image_metadata(image_url: str) -> List[PostPredictionData]:
    """Generate image metadata.

    Returns:
        A list of PostPredictionData containing results from hashtag generation.
    """
    result_json = _get_imagga_data(imageUrl)
    predictions = []
    for json_object in result_json.result.tags:
        tag = json_object['tag']['en']
        confidence = json_object['confidence']
        prediction = PostPredictionData(confidence, tag)
        predictions.add(prediction)
    return image_metadata
