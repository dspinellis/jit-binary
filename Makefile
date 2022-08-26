#
# Copyright 2022 Diomidis Spinellis
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Compile and run on demand programs distributed in source code form
#

BIN_DIR?=$(HOME)/bin
INST_DIR=$(BIN_DIR)/jit-binary

CFLAGS=-O

# Single C file
bin/%: src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"

# Makefile project named X.
# Running make in directory X should result in an X/X binary
bin/%: src/%.make
	$(MAKE) -C "$<"
	cp "$</$(@F)" "$@"

# Installation rules for the jit-binary project
install:
	mkdir -p "$(INST_DIR)/bin" "$(INST_DIR)/src"
	cp README.md Makefile jit-binary "$(INST_DIR)/"
	echo bin >"$(INST_DIR)/.gitignore"
