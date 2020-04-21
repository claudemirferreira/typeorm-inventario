import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToMany } from "typeorm";
import { Inventario } from "./inventario";
import { Lancamento } from "./lancamento";
import { Endereco } from "./endereco";

@Entity({name:"inv_contagem"})
export class Contagem {

    @PrimaryGeneratedColumn({name:"cont_id"})
    id: number;

    @Column({ nullable:false })
    numeroContagem: number;

    @ManyToOne(type => Inventario, inventario => inventario.contagens)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

    @ManyToOne(type => Endereco, endereco => endereco.contagens)
    @JoinColumn({ name: "ende_id" })
    endereco: Endereco;

    @OneToMany(type => Lancamento, lancamento => lancamento.contagem)
    lancamentos: Lancamento[];

}
