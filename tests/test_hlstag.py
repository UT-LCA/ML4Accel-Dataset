import jinja2

# experimental testing of custom jinja2 extension

test_source = """
#include <stdio.h>
#include <stdlib.h>

const array_size = 10;

void kernel(int a[array_size], int b[array_size], int c[array_size]) {
    
    {{ xilinx_pipeline(off=True) }}
    {{ xilinx_intel(off=True) }}
    for (int i = 0; i < array_size; i++) {
        c[i] = a[i] + b[i];
    }

}
"""
ast = jinja2.Environment().parse(test_source)
print(ast)
template = jinja2.Template(ast)

# t_test = env.parse(test_source)
# print(t_test)


# template = env.from_string(test_source)
# output = template.render()
# print(output)

"""
Template(body=[
    Output(nodes=[
        TemplateData(data='\n#include <stdio.h>\n#include <stdlib.h>\n\nconst array_size = 10;\n\nvoid kernel(int a[array_size], int b[array_size], int c[array_size]) {\n    \n    '),
        Call(node=Name(name='xilinx_pipeline', ctx='load'), args=[], kwargs=[], dyn_args=None, dyn_kwargs=None),
        TemplateData(data='\n    for (int i = 0; i < array_size; i++) {\n        c[i] = a[i] + b[i];\n    }\n\n}')
    ])
])
"""
