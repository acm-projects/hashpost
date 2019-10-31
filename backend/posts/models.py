"""Domain-layer abstractions for data models that the client will accept."""

from typing import List, Dict, Tuple


class ImagePost:
    """A data container for post attributes.

    This is used to store post data after being generated using
    machine learning.

    Attributes:
        uid (str): A unique identifier for this post
        image_url (str): The downloadable location
        hashtags (List[Dict[str, int]]): A list of hashtags and their confidence ratings
        captions (List[Dict[str, int]]): A list of captions and their confidence ratings
    """

    def __init__(self, uid: str, image_url: str, hashtags: List[Dict[str, int]],
                 captions: List[Dict[str, int]], upload_timestamp: int, segments: List[Tuple[int, int]]):
        self.uid = uid
        self.image_url = image_url
        self.hashtags = hashtags
        self.captions = captions
        self.upload_timestamp = upload_timestamp


class TextPost:
    """A data container for text post attributes."""

    def __init__(self, uid: str, content: str, hashtags: List[Dict[str, int]],
                 captions: List[Dict[str, int]], upload_timestamp: int):
        self.uid = uid
        self.content = content
        self.hashtags = hashtags
        self.captions = captions
        self.upload_timestamp = upload_timestamp


class AddTextPostMetadata:
    """Metadata needed to upload a new text post to the backend.

    Attributes:
        text (str): The contents of the post
    """

    def __init__(self, text: str):
        self.text = text


class AddImagePostMetadata:
    """Metadata needed to upload a new image post to the database.

    Attributes:
        image_url (str): A URL to this image stored in Cloud Storage
    """

    def ___init__(self, image_url: str):
        self.image_url = image_url
