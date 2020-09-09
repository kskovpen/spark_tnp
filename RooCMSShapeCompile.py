#!/bin/env python

import os, sys, ROOT

os.system("rm -rf RooCMSShape_*")

ROOT.gROOT.SetBatch()

ROOT.gROOT.ProcessLine("gErrorIgnoreLevel = 2001;")
ROOT.gROOT.LoadMacro('RooCMSShape.cc+')
