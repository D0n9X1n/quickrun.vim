#!/usr/bin/env python
# encoding: utf-8

import webbrowser
import os
import platform
import vim

def findConfigFile(configFileName):
    currentPath = os.getcwd();
    configFilePath = os.path.join(currentPath, configFileName);

    if (os.path.exists(configFilePath)):
        vim.command("let g:hasConfigFile = 1")
    else:
        vim.command("let g:hasConfigFile = 0")


def runWithConfigFile(configFileName):
    currentPath = os.getcwd();
    configFilePath = os.path.join(currentPath, configFileName);

    print(configFilePath);

    reader = open(configFilePath);
    # the config file only will have non-vim command
    command = "!" + reader.read();
    reader.close();

    vim.command(command);

