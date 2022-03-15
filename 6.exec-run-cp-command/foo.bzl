# The ctx argument provides information about the target.
def _copy_file(ctx):
    outs = []
    for src_file in ctx.files.srcs:
        out = ctx.actions.declare_file(ctx.attr.name + "/" + src_file.basename)
        outs.append(out)
        print(out)
        ctx.actions.run(
            executable = "cp",
            arguments = [src_file.path, out.path],
            outputs = [out],
            inputs =[src_file],
            mnemonic = "CopyFile",
            progress_message = "Copying {}".format(src_file.path)
        )
    return DefaultInfo(
        files = depset(outs)
    )


copy_file = rule(
    implementation = _copy_file,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            allow_empty = False,
            mandatory = True
        )
    }
)