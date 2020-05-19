import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn } from "typeorm";
import { Inventario } from "./inventario";
import { Endereco } from "./endereco";

@Entity({ name: "saa_empresa" })
export class Empresa {

    @PrimaryColumn({ length: 14 })
    cnpj: string;

    @Column({ nullable: false, length: 100 })
    nome: string;

    @Column({ nullable: false, length: 100 })
    email: string;

    @Column({ nullable: false, length: 100 })
    endereco: string;

    @Column({ nullable: true, length: 30 })
    telefone: string;

}
