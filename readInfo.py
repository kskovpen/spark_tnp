#!/bin/env python

import sys
import ROOT

ROOT.gROOT.SetBatch()

def readInfo(fname, trname):
    f = ROOT.TFile(fname, 'read')
    tr = f.Get(trname)
    tr.GetEntry(0)

    print('chi2P', tr.chi2P)
    print('chi2F', tr.chi2F)
    
    f.Close()

if __name__ == "__main__":
    
    argv = sys.argv[1:]
    readInfo(*argv)
    sys.exit(0)
    
