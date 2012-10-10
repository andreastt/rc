import sublime, sublime_plugin
import subprocess

class RunLintCommand(sublime_plugin.TextCommand):
  def run(self, edit):
      command = ["/home/andreastt/dev/depot_tools/cpplint.py", self.view.file_name()]
      process = subprocess.Popen(command, shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
      print process.communicate()[1]﻿
