#!/bin/bash 
iplocall=($(ip -brief a show scope global up|cut -c22-|tr -s " \n" "\n")); 
