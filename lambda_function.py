import structlog
from structlog.contextvars import bound_contextvars

structlog.configure(processors=[
    structlog.contextvars.merge_contextvars,
    structlog.processors.EventRenamer("message"),
    structlog.processors.add_log_level,
    structlog.processors.TimeStamper(fmt="iso"),
    structlog.processors.JSONRenderer()
])
logger = structlog.get_logger()

def handler(event, context):
    logger.debug(event)
    return {
        "statusCode": 200,
        "body": "Hello World"
    }