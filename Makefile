PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.3.14
COLLECTION_VERSION ?= 0.4.13
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator
COMMUNITY_OPERATOR_NAME ?= postgres-operator-krestomatio

include hack/mk/main.mk
