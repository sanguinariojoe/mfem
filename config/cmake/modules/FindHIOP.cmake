# Copyright (c) 2010-2023, Lawrence Livermore National Security, LLC. Produced
# at the Lawrence Livermore National Laboratory. All Rights reserved. See files
# LICENSE and NOTICE for details. LLNL-CODE-806117.
#
# This file is part of the MFEM library. For more information and source code
# availability visit https://mfem.org.
#
# MFEM is free software; you can redistribute it and/or modify it under the
# terms of the BSD-3 license. We welcome feedback and contributions, see file
# CONTRIBUTING.md for details.

# Sets the following variables:
#   - HIOP_FOUND
#   - HIOP_INCLUDE_DIRS
#   - HIOP_LIBRARIES

# It also creates the target (CMake package style) HIOP::HIOP

include(MfemCmakeUtilities)
mfem_find_package(HIOP HIOP HIOP_DIR
  "include" "hiopInterface.hpp"
  "lib" "hiop"
  "Paths to headers required by HIOP."
  "Libraries required by HIOP.")

# this test fails with parallel MFEM since mpi.h is not available (cxx compiler is used for some reason)
#  CHECK_BUILD HIOP_VERSION_OK TRUE
#"
##include <hiopInterface.hpp>
#using namespace hiop;
#int main(int argc, char *argv[])
#{
#   MPI_Init(&argc, &argv);
#   MPI_Comm comm = MPI_COMM_WORLD;
#
#   return 0;
#}
#")

if(HIOP_FOUND)
  mfem_library_to_package(HIOP::HIOP "${HIOP_INCLUDE_DIRS}" "${HIOP_LIBRARIES}")
endif()
