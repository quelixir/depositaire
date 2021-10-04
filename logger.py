import config

import logging, sys

logger = logging.getLogger("depositaire_logger")

# # upon Python 3.10 release...
# match config.get('LOGGING_LEVEL').lower():
#     case 'debug':
#         logger.setLevel(logging.DEBUG)
#     case 'info':
#         logger.setLevel(logging.INFO)
#     case 'warning':
#         logger.setLevel(logging.WARNING)
#     case 'error':
#         logger.setLevel(logging.ERROR)
#     case 'critical':
#         logger.setLevel(logging.CRITICAL)
#     case _:
#         logger.setLevel(logging.WARNING)

if config.get('LOGGING_LEVEL').lower() == 'debug':
    logger.setLevel(logging.DEBUG)
elif config.get('LOGGING_LEVEL').lower() == 'info':
    logger.setLevel(logging.INFO)
elif config.get('LOGGING_LEVEL').lower() == 'warning':
    logger.setLevel(logging.WARNING)
elif config.get('LOGGING_LEVEL').lower() == 'error':
    logger.setLevel(logging.ERROR)
elif config.get('LOGGING_LEVEL').lower() == 'critical':
    logger.setLevel(logging.CRITICAL)
else:
    logger.setLevel(logging.WARNING)

h1 = logging.FileHandler(filename=config.get('LOGGER_FILE'))
logger.addHandler(h1)
logger.info("testing %d.. %d.. %d..", 1, 2, 3)
