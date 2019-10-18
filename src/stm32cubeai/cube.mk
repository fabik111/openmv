# This file is part of the OpenMV project.
#
# Copyright (c) 2019 STMicroelectronics
#
# This work is licensed under the MIT license, see the file LICENSE for details.

# Overwrite OMV_QSTR_DEFS
OMV_QSTR_DEFS = $(TOP_DIR)/stm32cubeai/qstrdefscubeai.h


#CFLAGS += '-DMP_CONFIGFILE=<$(TOP_DIR)/stm32cubeai/mpconfigportcubeai.h>'
# Ugly way to make it work on Windows
CFLAGS += '-DMP_CONFIGFILE=<../../../stm32cubeai/mpconfigportcubeai.h>'

FIRM_OBJ += $(wildcard $(BUILD)/$(CMSIS_DIR)/src/dsp/BasicMathFunctions/*.o)
FIRM_OBJ += $(wildcard $(BUILD)/$(CMSIS_DIR)/src/dsp/SupportFunctions/*.o)

FIRM_OBJ += $(addprefix $(BUILD)/stm32cubeai/data/,\
	network.o                       \
	network_data.o                  \
	)

FIRM_OBJ += $(addprefix $(BUILD)/stm32cubeai/,\
	nn_st.o                         \
	py_st_nn.o                      \
	)

FIRM_OBJ += -l:NetworkRuntime410_CM7_GCC.a -Lstm32cubeai/AI/Lib -lc -lm
