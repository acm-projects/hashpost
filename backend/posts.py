"""Functions related to post management and database communcation."""

class PostMetadata:
    """A data container for post attributes."""

    def __init__(self):
        # TODO: Define post attributes
        pass


def add_post(post: PostMetadata):
    """Upload a post's metadata to our database.

    Our database is currently Google Cloud Firestore.

    Args:
        post (PostMetadata): The post to upload
    """

def delete_post(post_id: str):
    """Remove a post from the database given an ID.
    
    Args:
        post_id (str): The ID of the post to delete 
    """