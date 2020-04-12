import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToMany} from "typeorm";
import { Inventario } from "./inventario";
import { Item } from "./item";
import { Lancamento } from "./lancamento";

@Entity({name:"inv_contagem"})
export class Contagem {

    @PrimaryGeneratedColumn({name:"cont_id"})
    id: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    numeroContagem: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidade: number;

    @ManyToOne(type => Inventario, inventario => inventario.contagens)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

    @ManyToOne(type => Item, item => item.contagens)
    @JoinColumn({ name: "item_id" })
    item: Item;

    @OneToMany(type => Lancamento, lancamento => lancamento.contagem)
    lancamentos: Lancamento[];

}
