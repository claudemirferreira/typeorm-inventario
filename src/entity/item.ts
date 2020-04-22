import { Entity, Column, OneToMany, JoinColumn, Index, PrimaryGeneratedColumn, PrimaryColumn } from "typeorm";
import { Endereco } from "./endereco";

@Entity({name:"inv_item"})
export class Item {

    @PrimaryColumn({ length:20})
    codigo: string;

    @Column({length:200, nullable:false})
    nome: string;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidadeSistema: number;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidadeFisica: number;

    @OneToMany(type => Endereco, endereco => endereco.item)
    @JoinColumn({ name: "ende_id" })
    enderecos: Endereco[];

}
