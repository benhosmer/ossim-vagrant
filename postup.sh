#!/bin/bash

salt-call state.sls postgresql
salt-call state.sls ossim
salt-call state.sls omar

