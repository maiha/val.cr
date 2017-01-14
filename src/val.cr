macro val(ast)
  {% if ast.is_a?(Assign) %}
    getter({{ast.target.id}}) { {{ast.value}} }
  {% elsif ast.is_a?(TypeDeclaration) %}
    getter({{ast.var.id}} : {{ast.type.id}}) { {{ast.value}} }
  {% else %}
    raise "macro val expects Assign | TypeDeclaration, but got {{ ast.type }}"
  {% end %}
end                           

macro var(ast)
  {% if ast.is_a?(Assign) %}
    property({{ast.target.id}}) { {{ast.value}} }
  {% elsif ast.is_a?(TypeDeclaration) %}
    property({{ast.var.id}} : {{ast.type.id}}) { {{ast.value}} }
  {% else %}
    raise "macro var expects Assign | TypeDeclaration, but got {{ ast.type }}"
  {% end %}
end                           
