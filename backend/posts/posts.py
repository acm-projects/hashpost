"""Functions related to post management and database communcation."""

from typing import List
from firebase_admin import firestore, initialize_app
from google.cloud.exceptions import NotFound
from intelligence import generate_image_metadata
from models import AddPostMetadata, PostMetadata
from exceptions import CreatePostException, GetPostException, UnknownPostIdException, DeletePostException

COLLECTION_POSTS = u'/posts'

# Initialize Firebase with Application Default Credentials
initialize_app(name='hashpost')

db = firestore.client()


def add_post(data: AddPostMetadata) -> str:
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
        # TODO: Add timestamp to document
        return doc.id
    except:
        raise CreatePostException()


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
        posts = db.collection(COLLECTION_POSTS) \
            .document(post_id) \
            .get()
        # TODO: Validate that this post is text
        if len(posts) < 1:
            raise UnknownPostIdException()
        return posts[0]
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
