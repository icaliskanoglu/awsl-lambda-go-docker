FROM public.ecr.aws/lambda/python:3.10

# Install the function's dependencies using file requirements.txt
# from your project folder.

COPY --from=public.ecr.aws/datadog/lambda-extension:43 /opt/extensions/ /opt/extensions

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

ENV DD_LAMBDA_HANDLER="lambda_function.handler"
CMD [ "datadog_lambda.handler.handler" ] 