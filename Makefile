PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.3.2
COLLECTION_VERSION ?= 0.4.7
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
