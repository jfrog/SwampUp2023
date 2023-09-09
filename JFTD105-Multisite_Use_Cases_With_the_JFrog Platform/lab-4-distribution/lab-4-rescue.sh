# create release bundle
jf c use swampup
jf ds rbc --spec=rb-spec.json rb_jftd105_swamp 1.0.2 --desc="release candidate"

# sign release bundle
jf ds rbs rb_jftd105_swamp 1.0.2

# distribute release bundle
jf ds rbd --dist-rules=dist-rules.json rb_jftd105_swamp 1.0.2