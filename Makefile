PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.2.45
COLLECTION_VERSION ?= 0.3.70
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator

include hack/mk/main.mk
