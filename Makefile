PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.2.7
COLLECTION_VERSION ?= 0.3.14
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
