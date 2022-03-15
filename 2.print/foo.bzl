# The ctx argument provides information about the target.
def _foo_binary_impl(ctx):
#    ctx.label corresponds to the label of the target being analyzed
    print("analyzing", ctx.label)

foo_binary = rule(
    implementation = _foo_binary_impl,
)

print("bzl file evaluation")
