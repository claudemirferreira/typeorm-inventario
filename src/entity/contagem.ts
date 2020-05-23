import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from "typeorm";
import { Inventario } from "./inventario";
import { Endereco } from "./endereco";

@Entity({name:"inv_contagem"})
export class Contagem {

    @PrimaryGeneratedColumn({name:"cont_id"})
    id: number;

    @Column({ nullable:false, length: 1 })
    numeroContagem: string;

    @Column({ nullable:false, length:1 })
    status: string;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:true})
    quantidade: number;

    @Column({ nullable:true})
    data: Date;

    @Column({length:100})
    observacao: string;

    @ManyToOne(type => Inventario, inventario => inventario.contagens)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

    @ManyToOne(type => Endereco, endereco => endereco.contagens)
    @JoinColumn({ name: "ende_id" })
    endereco: Endereco;

}
