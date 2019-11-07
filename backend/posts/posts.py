"""Functions related to post management and database communcation."""

from typing import List

import firebase_admin   
from firebase_admin import firestore, initialize_app, credentials, storage
import pyrebase

from flask import Flask, render_template, request, flash, redirect, url_for
from werkzeug.utils import secure_filename

from google.cloud.exceptions import NotFound
from intelligence import generate_image_metadata
from models import AddPostMetadata, PostMetadata
from exceptions import CreatePostException, GetPostException, UnknownPostIdException, DeletePostException

COLLECTION_POSTS = u'/posts'

# Initialize Firebase with Application Default Credentials
initialize_app({'storageBucket': 'hashpost.appspot.com'})
bucket = storage.bucket()

db = firestore.client()

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

def add_post(data: AddPostMetadata) -> PostMetadata:
    """Upload a post's metadata to our database.
    Our database is currently Google Cloud Firestore.

    Args:
        post (AddPostMetadata): Data for the post to upload
    
    Returns:
        The ID (str) of the document created.
    
    Raises:
        CreatePostException if an internal server error occurred.
    """
    
    try:
        post_data = generate_image_metadata(data.image_url)
        (timestamp, doc) = db.collection(COLLECTION_POSTS) \
            .add(post_data.to_json())
        return post_data
    except:
        raise CreatePostException()

def upload(image):
    """Uploads a file to the bucket."""
    if image.filename == '': # If File Name is Empty
        flash('No selected file')
        return redirect(request.url)
    if image and allowed_file(image.filename): # If Image Exists And Is An Allowed Extension
        fileName = secure_filename(image.filename) # Store File Name
    path = "posts/" + fileName

    blob = bucket.blob(path) # Set Destination
    blob.upload_from_file(image) # Upload Image File

    imgUrl = blob.path # Get Image URL Of BLOB
    return imgUrl

def get_posts() -> List[PostMetadata]:
    """Queries all posts that match the given filters.

    Returns:
        (Currently) all uploaded posts in the database.
    """
    try:
        posts = db.collection(COLLECTION_POSTS) \
            .stream()
        # TODO: Filter by parameters
        return posts
    except:
        raise GetPostException()


def get_post_by_id(post_id: str) -> PostMetadata:
    """Fetch a post given its ID.
    
    Returns:
        A PostMetadata object containing post data.
    """
    try:
        doc = db.collection(COLLECTION_POSTS) \
            .document(post_id) \
            .get()
        if len(posts) < 1:
            raise UnknownPostIdException()
        return
    except NotFound:
        raise UnknownPostIdException()
    except:
        raise GetPostException()


def delete_post(post_id: str):
    """Remove a post from the database given an ID.

    Args:
        post_id (str): The ID of the post to delete 
    """
    try:
        db.collection(COLLECTION_POSTS) \
            .document(post_id) \
            .delete()
    except NotFound:
        raise UnknownPostIdException()
    except:
        raise DeletePostException()

# Helper Functions
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
