#!/usr/bin/env python
# encoding: utf-8

import webbrowser
import os
import platform
import vim


def letVimRunCommand(command):
    try:
        vim.command(command);
    except (KeyboardInterrupt, Exception):
        # do nothing
        return;

def findConfigFile(configFileName):
    currentPath = os.getcwd();
    configFilePath = os.path.join(currentPath, configFileName);

    if (os.path.exists(configFilePath)):
        letVimRunCommand("let g:hasConfigFile = 1")
    else:
        letVimRunCommand("let g:hasConfigFile = 0")

def runWithConfigFile(configFileName):
    currentPath = os.getcwd();
    configFilePath = os.path.join(currentPath, configFileName);

    print(configFilePath);

    reader = open(configFilePath);
    # the config file only will have non-vim command
    command = "!" + reader.read();
    reader.close();

    letVimRunCommand(command)
