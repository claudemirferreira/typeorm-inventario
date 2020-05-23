import { Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, ManyToOne} from "typeorm";
import { Contagem } from "./contagem";
import { Execucao } from "./execucao";
import { Item } from "./item";
import { Empresa } from "./Empresa";
import { ItemXls } from "./item-xls";

@Entity({name:"inv_inventario"})
export class Inventario {

    @PrimaryGeneratedColumn({name:"inve_id"})
    id: number;

    @Column({nullable:false})
    data: Date;

    @Column({length:30, nullable:false})
    nome: string;

    @Column({ nullable:false, length:1})
    numeroContagem: string;

    @OneToMany(type => Contagem, contagem => contagem.inventario)
    contagens: Contagem[];

    @OneToMany(type => Execucao, execucao => execucao.inventario)
    execucoes: Execucao[];

    @OneToMany(type => Item, item => item.inventario)
    @JoinColumn({ name: "item_id" })
    itens: Item[];

    @OneToMany(type => ItemXls, itemXls => itemXls.inventario)
    @JoinColumn({ name: "item_xls_id" })
    itensXls: ItemXls[];

    @ManyToOne(type => Empresa, empresa => empresa.inventarios)
    @JoinColumn({ name: "empr_cnpj" })
    empresa: Empresa;

}
