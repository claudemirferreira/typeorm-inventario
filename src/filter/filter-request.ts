import { PageWrapper } from './../wrapper/page-wrapper';
export class FilterQuery {
    limit:number = 10;
    page:number = 0;
    ordering: string;
    is_active: boolean = true;
    fields: string;
    name: string;

    constructor(query: any) {
        this.limit = query.limit ? parseInt(query.limit) : this.limit;
        this.page = query.page ? this.pageValidation(parseInt(query.page)) : this.page;
        this.ordering = query.ordering;
        this.is_active = query.is_active ? query.is_active: this.is_active;
        this.fields = query.fields;
        this.name = query.name;
    }

    private pageValidation(page: number):number {
        return page < 0 ? 0 : page
    }
}