import { Entity, Column, OneToMany, JoinColumn, PrimaryGeneratedColumn, ManyToOne } from "typeorm";
import { Endereco } from "./endereco";
import { Empresa } from "./Empresa";
import { Inventario } from "./inventario";

@Entity({name:"inv_item"})
export class Item {

    @PrimaryGeneratedColumn({name:"item_id"})
    id: string;

    @Column({ length:60 })
    codigo: string;

    @Column({length:200, nullable:false})
    nome: string;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidadeSistema: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidadeFisica: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    primeiraContagem: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    segundaContagem: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    terceiraContagem: number;

    @OneToMany(type => Endereco, endereco => endereco.item, { cascade: true })
    @JoinColumn({ name: "ende_id" })
    enderecos: Endereco[];

    @ManyToOne(type => Empresa, empresa => empresa.itens)
    @JoinColumn({ name: "empr_cnpj" })
    empresa: Empresa;

    @ManyToOne(type => Inventario, inventario => inventario.itens)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

}
