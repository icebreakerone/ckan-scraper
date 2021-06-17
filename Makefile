BASE_URL ?= http://search.energydata.org.uk/api/3/action
WRITE_BASE_URL ?= http://search-beta.energydata.org.uk/api/3/action

all: create_datasets create_orgs

data/datasets.json: data
	curl -sS ${BASE_URL}/package_list > data/datasets.json

data/orgs.json: data
	curl -sS ${BASE_URL}/organization_list > data/orgs.json

data/orgs:
	mkdir -p data/orgs

data/datasets:
	mkdir -p data/datasets

data:
	mkdir -p data

.PHONY: fetch_datasets
fetch_datasets: data/datasets.json data/datasets
	BASE_URL="${BASE_URL}" ./fetch_datasets

.PHONY: fetch_orgs
fetch_orgs: data/orgs.json data/orgs
	BASE_URL="${BASE_URL}" ./fetch_orgs

.PHONY: create_datasets
create_datasets: fetch_datasets
	BASE_URL="${WRITE_BASE_URL}" ./create_datasets

.PHONY: create_orgs
create_orgs: fetch_orgs
	BASE_URL="${WRITE_BASE_URL}" ./create_orgs
