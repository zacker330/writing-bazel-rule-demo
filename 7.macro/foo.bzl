def writeVersion(name, version, src, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = ["v_" + src],
        cmd = "echo "+ version + " > $@" ,
        **kwargs
    )

#    Use **kwargs to forward the extra arguments to the underlying genrule (it works just like in Python). This is useful, so that a user can use standard attributes like visibility, or tags.