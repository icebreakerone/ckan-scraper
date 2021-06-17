# CKAN Scraper

This repository contains a tool for scraping data from one CKAN
repository into another.  Typically people use [CKAN's harvesting
extension](https://github.com/ckan/ckanext-harvest/) to do this.

This scraper requires no extra tooling within CKAN itself, but takes a
simpler, clumsier approach to data replication using [CKAN's
API](https://docs.ckan.org/en/latest/api/), storing its JSON output
locally.

# Dependencies

## Software

This software requires tools typically found on a Unix system such as
`curl`, `jq`, `make` and `perl`.

## CKAN API Token

You will need a [CKAN API
token](https://docs.ckan.org/en/latest/api/#authentication-and-api-tokens)
for the CKAN instance you wish to write to.  The user associated with
the token will need access to create organisations and packages
(datasets).  Store the token in a file named `API_TOKEN` in the same
directory as this README document or in a `CKAN_API_TOKEN` environment
variable.

# Running

## Environment

In addition to the API token described above, set the following
environment variables:

- `BASE_URL`: The CKAN API endpoint to read from such as
  `http://example.org/api/3/action`
- `WRITE_BASE_URL`: The CKAN API endpoint to write to such as
  `http://example.org/api/3/action`

## Commands

Commands are typically run from a Makefile.  To run a complete migration
process, run `make all`; to run individual steps, run `make TARGET`
where _TARGET_ takes one or more of the following values:

- `all`: run the complete migration process
- `fetch`: fetch all datasets and organisations
- `fetch_datasets`: fetch all datasets
- `fetch_orgs`: fetch all organisations
- `create_datasets`: create all datasets from already fetched data
- `create_orgs`: create all organisations from already fetched data

# Bugs

Certainly.  This was a quick hack job.  Feel free to report and fix any
bugs you find.
