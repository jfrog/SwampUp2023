# create release bundle
jf ds rbc --spec=rb-spec.json rb_swamp 1.0.0 --desc="release candidate"

# sign release bundle
jf ds rbs rb_swamp 1.0.0

# distribute release bundle
# Note: Please edit the "site_name" value in dist-rules.json file to the actual site name of your edge instance.
jf ds rbd --dist-rules=dist-rules.json rb_swamp 1.0.0