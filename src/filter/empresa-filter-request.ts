export class EmpresaFilterQuery {
    cnpj:string;    
    nome:string

    constructor(query: any) {
        this.cnpj = query.cnpj;
        this.nome = query.nome;
    }

    private pageValidation(page: number):number {
        return page < 0 ? 0 : page
    }
}