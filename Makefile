PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.2.1
COLLECTION_VERSION ?= 0.3.1
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
