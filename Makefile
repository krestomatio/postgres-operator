PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.3.0
COLLECTION_VERSION ?= 0.4.5
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
