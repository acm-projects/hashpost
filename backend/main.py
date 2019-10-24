import json
from flask import Request, make_response
from posts.posts import get_posts
from posts.models import AddPostMetadata
from posts.exceptions import CreatePostException, GetPostException, UnknownPostIdException

REQUEST_ARG_USER_ID = 'userId'
REQUEST_ARG_POST_ID = 'postId'
REQUEST_ARG_IMAGE_URL = 'imageUrl'

def posts(request: Request) -> Response:
    """Return data related to posts.

    This endpoint supports GET requests and POST requests. A HTTP GET request
    to this endpoint will return all given posts that match the parameters given.

    Args:
        request (flask.Request): The request object.
        <http://flask.pocoo.org/docs/1.0/api/#flask.Request>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>.

    """
    response = None
    if request.method == 'GET':
        # TODO(posts): Fetch individual posts
        try:
            posts = get_posts()
            posts_json = json.dumps(posts)
            status = 200
            headers = {
                'Content-Length': len(posts_json)
            }
            response = make_response((posts_json, status, headers))
        except GetPostQueryException:
            error_body = {
                'errorCode': 'unknown',
                'message': 'An unknown server error occured. Try again later.'
            }
            response = make_response((error_body, 500))
        except UnknownPostIdException:
            error_body = {
                'errorCode': 'unknownPostId',
                'message': 'The provided post does not exist.'
            }
            response = make_response((error_body, 404))
        except:
            response = _generate_server_error()
    elif request.method === 'POST':
        try:
            imageUrl = request.args.get(REQUEST_ARG_IMAGE_URL)
            if imageUrl is None or imageUrl == ''
                add_post_metadata = AddPostMetadata()
            # TODO: Handle uploads
        except CreatePostException:
            response = _generate_server_error()
    else:
        error_body = {
            'errorCode': 'methodNotSupported',
            'message': 'This HTTP method is support supported by this server.'
        }
        response = make_response((error_body, 405))
    return response


def auth(request: Request) -> Response:
    """Handle authentication requests.

    This endpoint supports GET requests and POST requests.

    Args:
        request (flask.Request): The request object.
        <http://flask.pocoo.org/docs/1.0/api/#flask.Request>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>.

    """
    # TODO: Handle request
    return Response('OK', status=200)


def _generate_server_error() -> Response:
    error_body = {
        'errorCode': 'unknown',
        'message': 'An unknown server error occured. Try again later.'
    }
    return make_response((error_body, 500))