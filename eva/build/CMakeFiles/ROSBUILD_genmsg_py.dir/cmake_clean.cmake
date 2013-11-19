FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/eva/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/eva/msg/__init__.py"
  "../src/eva/msg/_arm_vel_msg.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
