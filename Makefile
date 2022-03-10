PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.0.1
COLLECTION_VERSION ?= 0.0.71
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
