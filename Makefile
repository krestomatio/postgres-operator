PROJECT_SHORTNAME ?= postgres
VERSION ?= 0.3.20
COLLECTION_VERSION ?= 0.4.21
OPERATOR_TYPE ?= ansible
PROJECT_TYPE ?= $(OPERATOR_TYPE)-operator
COMMUNITY_OPERATOR_NAME ?= postgres-operator-krestomatio

include hack/mk/main.mk
