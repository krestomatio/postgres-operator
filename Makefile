PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.1.6
COLLECTION_VERSION ?= 0.1.11
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
