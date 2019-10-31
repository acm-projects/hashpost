from typing import List


class HashtagPrediction:
    """A single prediction for a hashtag; a mapping of a hashtag to its confidence.

    Attributes:
        hashtag (str): A possibly relevant hashtag for a piece of content
        confidence (float): The probability that the hashtag is relevant
    """

    def __init__(self, hashtag: str, confidence: float):
        self.hashtag = hashtag
        self.confidence = confidence


class ClassPrediction:
    """A single prediction for an object's class; a mapping of a class to its confidence.

    Attributes:
        object_class (str): The category of
        confidence (float): The probability that the hashtag is relevant
    """

    def __init__(self, object_class: str, confidence: float):
        self.object_class = object_class
        self.confidence = confidence


class TextPostPredictionResult:
    def __init__(self, hashtags: List[HashtagPrediction], entities: List[str]):
        pass


class ImagePostPredictionResult:
    """
    Attributes:
        hashtags (List[HashtagPrediction]): A list of eight relevant hashtags
        classes (List[str])
    """

    def __init__(self, hashtags: List[HashtagPrediction], classes: List[str]):
        pass


class PredictionSuggestion:
    """A suggestion to re-tag a data point.

    Attributes:
        prediction_id (str):
        new_value (dict): A json payload containing new data
    """

    def __init__(self, prediction_id: str, new_value: dict):
        pass
