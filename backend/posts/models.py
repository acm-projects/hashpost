
class PostMetadata:
    """A data container for post attributes.

    This is used to store post data after being generated using
    machine learning.
    """

    def __init__(self, id: str, image_url: str, hashtags: list, caption: str):
        self.id = id
        self.image_url = image_url
        self.hashtags = hashtags
        self.caption = caption


class AddPostMetadata:

    def ___init__(self, image_url: str):
        self.image_url = image_url
