import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn} from "typeorm";
import { Inventario } from "./inventario";

@Entity({name:"inv_item_xls"})
export class ItemXls {

    @PrimaryGeneratedColumn({name:"item_xls_id"})
    id: number;

    @Column({length:200, nullable:false})
    nome: string;

    @Column({length:20, nullable:false})
    codigo: string;

    @Column({length:6, nullable:false})
    unidade: string;

    @Column({length:50, nullable:false})
    endereco: string;

    @Column({length:60, nullable:false})
    boleto: string;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidade: number;

    @ManyToOne(type => Inventario, inventario => inventario.itensXls)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

}
