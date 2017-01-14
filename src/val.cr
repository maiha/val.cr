macro val(ast)
  {% if ast.is_a?(Assign) %}
    {% var_name = ast.target.stringify.gsub(/\?/, "__p").gsub(/\!/, "__b").id %}
    def {{ast.target.id}}
      @{{var_name}} ||= begin {{ast.value}}; end
    end
  {% elsif ast.is_a?(TypeDeclaration) %}
    {% var_name = ast.var.stringify.gsub(/\?/, "__p").gsub(/\!/, "__b").id %}
    @{{var_name}} : {{ast.type.id}}?
    def {{ast.var.id}}
      @{{var_name}} ||= begin {{ast.value}}; end
    end
  {% else %}
    raise "macro val expects Assign | TypeDeclaration, but got {{ ast.type }}"
  {% end %}
end                           

macro var(ast)
  {% if ast.is_a?(Assign) %}
    {% var_name = ast.target.stringify.gsub(/\?/, "__p").gsub(/\!/, "__b").id %}
    def {{ast.target.id}}
      @{{var_name}} ||= begin {{ast.value}}; end
    end
    def {{ast.target.id}}=(v)
      @{{var_name}} = v
    end
  {% elsif ast.is_a?(TypeDeclaration) %}
    {% var_name = ast.var.stringify.gsub(/\?/, "__p").gsub(/\!/, "__b").id %}
    @{{var_name}} : {{ast.type.id}}?
    def {{ast.var.id}}
      @{{var_name}} ||= begin {{ast.value}}; end
    end
    def {{ast.var.id}}=(v)
      @{{var_name}} = v
    end
  {% else %}
    raise "macro var expects Assign | TypeDeclaration, but got {{ ast.type }}"
  {% end %}
end                           
