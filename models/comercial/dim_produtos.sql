with 
        categorias AS (
        SELECT *
        from
        {{ ref('stg_erpnw__categories') }}
    )
        ,produtos AS (
        SELECT *
        from
        {{ ref('stg_erpnw__products') }}
    )
        ,fornecedores AS (
        SELECT *
        from
        {{ ref('stg_erpnw__suppliers') }}
    )

    , uniao_tabelas as (
        select 
         produtos.id_categoria
        ,produtos.id_produto
        ,produtos.nome_produto
        ,produtos.quantidade_por_unidade_produto
        ,produtos.preco_por_unidade_produto
        ,produtos.unidades_em_estoque_produto
        ,produtos.unidades_na_ordem_produto
        ,produtos.ordem_de_reorg_produto
        ,categorias.nome_categoria
        ,categorias.descricao_categoria
        ,fornecedores.id_fornecedor		
        ,fornecedores.nome_compania_fornecedor					
        ,fornecedores.nome_contato_fornecedor			
        ,fornecedores.titulo_contato_fornecedor			
        ,fornecedores.endereco_cliente_fornecedor					
        ,fornecedores.cidade_cliente_fornecedor			
        ,fornecedores.regiao_cliente_fornecedor				
        ,fornecedores.caixa_postal_fornecedor
        ,fornecedores.pais_cliente_fornecedor
        ,fornecedores.fone_cliente_fornecedor
        ,fornecedores.fax_cliente_fornecedor
        from produtos
        left join categorias on produtos.id_categoria = categorias.id_categorias
        left join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor

    )

    , transformacoes as (
        select
        row_number() over (order by id_produto) as sk_produto    
            , *
        from uniao_tabelas
    )

select * from transformacoes

