PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.2.40
COLLECTION_VERSION ?= 0.3.63
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
