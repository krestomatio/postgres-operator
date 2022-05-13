PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.0.3
COLLECTION_VERSION ?= 0.1.0
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
