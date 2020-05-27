import { Entity, Column, PrimaryColumn, OneToMany, JoinColumn } from "typeorm";
import { Item } from "./item";
import { Inventario } from "./inventario";
import { User } from "./User";

@Entity({ name: "saa_empresa" })
export class Empresa {

    @PrimaryColumn({ length: 14, name: "empr_cnpj" })
    cnpj: string;

    @Column({ nullable: false, length: 100 })
    nome: string;

    @Column({ nullable: false, length: 100 })
    email: string;

    @Column({ nullable: false, length: 100 })
    endereco: string;

    @Column({ nullable: true, length: 30 })
    telefone: string;

    @OneToMany(type => Item, item => item.empresa)
    @JoinColumn({ name: "item_id" })
    itens: Item[];

    @OneToMany(type => Inventario, inventario => inventario.empresa)
    @JoinColumn({ name: "inve_id" })
    inventarios: Inventario[];

    @OneToMany(type => User, user => user.empresa)
    users: User[];

}
